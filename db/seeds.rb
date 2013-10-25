# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Food.create!(:barcode =>'00001', :company_name => '統洋', :product_name => '有機發芽黑豆漿', :capacity => 450, :capacity_unit => 'ml', 
#             :calory_kcal => 52, :protein_g =>3.5, :fat_g => 1.4, :fat_saturated_g => 0.1, :fat_trans_g => 0, 
#             :carbohydrate_g => 6.3, :sodium_mg => 12)


input = [
    ['00000001', '統洋', '有機發芽黑豆漿', 450, 'ml' ,52 ,3.5 ,1.4 ,0.1 ,0 ,6.3 ,12],
    ['00000002', '味全', '金穗豆漿', 1857, 'ml', 64, 3.9, 2.4, 0.4, 0, 6.6, 10],
    ['00000003', '義美', '黑芝麻豆奶', 2000, 'ml', 60.4, 3.4, 1.6, 0.3, 0, 8.1, 43],
    ['00000004', '光泉', '燕麥高纖鮮豆漿（無糖）', 450, 'ml', 41.4, 3.2, 1.8, 0.2, 0, 4.1, 24],
    ['00000005', '統一', '陽光黃金豆豆漿', 1858, 'ml', 56.7, 3.5, 1.9, 0.3, 0, 6.4, 15.7],
    ['00000006', '義美', '古早傳說豆奶', 2000, 'ml', 54.8, 2.9, 1.7, 0.4, 0, 7, 8.2],
    ['00000007', '光泉', '鮮豆漿', 1857, 'ml', 60.9, 3.7, 2.1, 0.2, 0, 6.8, 5.1],
    ['00000008', '義美', '燕麥豆奶', 1000, 'ml', 57.6, 3, 2, 0.4, 0, 6.9, 7.7],
    ['00000009''光泉', '高鈣減糖鮮豆漿', 1857, 'ml', 46.6, 3.4, 1.8, 0.2, 0, 4.2, 6.9],
    ['00000010', '豆之府', '甜味豆漿', 920, 'ml', 55, 3.3, 1.8, 0, 0, 6.4, 26],
    ['00000011', '豆之府', '杏仁豆漿', 920, 'ml', 55, 3.3, 1.8, 0, 0, 6.4, 26],
    ['00000012', '豆之府', '黑芝麻豆漿', 920, 'ml', 42.1, 3.2, 0.64, 0, 0, 5.8, 23.7],
    ['00000013', '擁馨', '優豆豆漿', 920, 'ml', 51, 3.46, 1.75, 0.7, 0, 6.7, 4.2],
    ['00000014', '味全', '大醇豆原味豆漿', 2004, 'ml', 61, 4.5, 2.6, 0.4, 0, 6, 21],
    ['00000015', '光泉', '米漿', 2720, 'ml', 65.9, 1.2, 1.9, 0.3, 0, 11, 8.7],
    ['00000016', '義美', '糙米奶', 2000, 'ml', 70, 1, 2, 0.8, 0, 12, 3]
]

input.each do |item|
    #Food.create!(:barcode => item[0], :company_name => item[1])
    Food.create!(:barcode => item[0], :company_name => item[1], :product_name => item[2], :capacity => item[3], :capacity_unit => item[4], 
             :calory_kcal => item[5], :protein_g => item[6], :fat_g => item[7], :fat_saturated_g => item[8], :fat_trans_g => item[9], 
             :carbohydrate_g => item[10], :sodium_mg => item[11])
end

