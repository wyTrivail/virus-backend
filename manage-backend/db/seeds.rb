
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'roo'
host = '127.0.0.1:3000'

virus_file = Roo::Excelx.new("/Users/yingwang/Documents/init_virus_data.xlsx")

virus_file.default_sheet = virus_file.sheets.first

header = virus_file.row(1)
(2..virus_file.last_row).each do |i|
    row = Hash[[header, virus_file.row(i)].transpose]
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


