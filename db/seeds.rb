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

company_seed = [
    ['佳格食品股份有限公司', '22102473', '曹德風', '臺北市大安區仁愛路3段136號5樓', '02-27092323'],
    ['泰山企業股份有限公司', '59661701', '詹岳霖', '彰化縣田中鎮興工路6號', '0800-079080']
]

food_seed = [
    ['0001', '得意的一天青春三元素葵花油', '佳格食品股份有限公司', 2, 'L', 100, 'ml', 20, 828, 0, 92, 8, 0, 0, 0],
    ['0002', '泰山健康好理由輕健美油', '泰山企業股份有限公司', 2, 'L', 100, 'ml', 20, 825, 0, 91.7, 8.3, 0, 0, 0],
    ['0003', '泰山健康好理由100%葡萄籽油', '泰山企業股份有限公司', 1.5, 'L', 100, 'ml', 15, 828, 0, 92, 11, 0, 0, 0]
]

news_seed = [
    ['TVBS', '不純！泰山、頂新、三多市　3「進口油」令下架', Time.local(2013,"oct",30,17,55,0), 
        '衛福部透過各縣市衛生局執行新一波的「清油下架」專案，其中，知名大廠泰山出品的「健康好理油100%純葡萄籽油」'\
        '、頂新集團出品的「寶素齋100%純葡萄籽油」，還有「三多市純橄欖油1000毫升裝」，這3款從國外原裝進口的食用油必須立刻下架',
        'http://tw.news.yahoo.com/%E5%BF%AB%E8%A8%8A-%E4%B8%8D%E7%B4%94-%E6%B3%B0%E5%B1%B1-%E9%A0%82%E6%96%B0-%E4%B8%89%E5%A4%9A%E5%B8%82-3-%E9%80%B2%E5%8F%A3%E6%B2%B9-%E4%BB%A4%E4%B8%8B%E6%9E%B6-095500036.html']
]

company_seed.each do |item|
    #Company.create!(:name => item[0], :company_no => item[1], :owner_name => item[2], :address => item[3], :phone_no => item[4])
    company = Company.create! do |c|
        c.name = item[0]
        c.company_no = item[1]
        c.owner_name = item[2]
        c.address = item[3]
        c.phone_no = item[4]
    end
end

food_seed.each do |item|
    c = Company.where(:name => item[2]).limit(1)
    food = Food.create! do |f|
        f.barcode = item[0]
        f.name = item[1]
        f.company_id = c[0].id
        f.capacity = item[3]
        f.capacity_unit = item[4]
        f.serving_vol = item[5]
        f.serving_unit = item[6]
        f.serving_size = item[7]
        f.calory_kcal = item[8]
        f.protein_g = item[9]
        f.fat_g = item[10]
        f.fat_saturated_g = item[11]
        f.fat_trans_g = item[12]
        f.carbohydrate_g = item[13]
        f.sodium_mg = item[14]
    end
    #Food.create!(:barcode => item[0], :name => item[1], :company_id => c[0].id, :capacity => item[3], :capacity_unit => item[4], :serving_vol => item[5], :serving_unit => item[6], :serving_size => item[7], 
#      :calory_kcal => item[8],
#      :protein_g => item[9],
#      :fat_g => item[10],
#      :fat_saturated_g => item[11],
#      :fat_trans_g => item[12],
#      :carbohydrate_g => item[13],
#      :sodium_mg => item[14])
end

news_seed.each do |item|
    news = News.create! do |n|
        n.source = item[0]
        n.title = item[1]
        n.timestamp = item[2]
        n.abstract = item[3]
        n.link = item[4]
    end
end




=begin
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

=end



