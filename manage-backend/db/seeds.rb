
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'roo'
host = '127.0.0.1:3000'
url_prefix = 'http://' + host+'/res/'

virus_file = Roo::Excelx.new("/Users/yingwang/Documents/init_virus_data.xlsx")

virus_file.default_sheet = virus_file.sheets.first

header = virus_file.row(1)
(2..virus_file.last_row).each do |i|
    row = Hash[[header, virus_file.row(i)].transpose]
    #提取图片文件名
    pic_name = row['pic_url']
    if not pic_name.nil?
        index = pic_name.index('配图文件名--')
        if index.nil?
            pic_name = nil
            row['pic_url'] = nil
        else
            pic_name = pic_name.lstrip
            pic_name = pic_name[index+8,pic_name.length-9]
            row['pic_url'] = url_prefix + pic_name + '.jpg'
        end
    end
    #处理收集时间，读进来是浮点数，蛋疼
    collected_gmt = row['collected_gmt']
    row['collected_gmt'] = collected_gmt.to_i

    #处理中文名，部分中文名自带双引号，蛋碎
    cn_name = row['cn_name']
    if not cn_name.nil?
        if cn_name.index("“")
            row['cn_name'] = cn_name[1,cn_name.length-2]
        end
    end
    Virus.create(row)
end


#生成初始版本的数据包
file_name = "virus-data-0"
data_package_url = url_prefix + "data-package/" + file_name
file_dir = "/Users/yingwang/workspace/virus-backend/manage-backend/public/res/data-package/"
viri = Virus.all
data_file = File.new(file_dir + file_name,"w")
data_file.puts(viri.to_json)
Package.create(:version=>1, :url=>data_package_url)
