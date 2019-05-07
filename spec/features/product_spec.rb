require 'rails_helper'

feature "出品投稿" do
  background do
      Category.create(name: "レディース", main_category_id: 1)
      Category.create(name: "トップス", main_category_id: 1, sub_category_id: 1,size_flg: 1, size_category_id: 1, brand_flg: 1)
      Category.create(name: "Tシャツ/カットソー(半袖/袖なし)", main_category_id: 1, sub_category_id: 1, sub_subcategory_id: 1)
      ProductSize.create(name: "XXX以下", size_category: 1)
      ProductShippingFee.create(name: "送料込み(出品者負担)")
      ProductShippingMethod.create(name: "未定", shipping_fee_category: 1)
      FactoryBot.create(:user)
  end
  scenario "正常に出品できる", js: true do

    # #出品フォームを表示
    visit sell_path
    expect(current_path).to eq sell_path

    # 画像のドラッグ&ドロップをシュミレート
    expect {
      page.execute_script <<-JS
      fakeFileInput = window.$('<input/>').attr(
        {id: 'fakeFileInput', type:'file'}
        ).appendTo('body');
        JS
      # Attach the file to the fake input selector
      attach_file("fakeFileInput", "#{Rails.root}/public/images/no_image.jpg")
      # Add the file to a fileList array
      page.execute_script("var fileList = [fakeFileInput.get(0).files[0]]")
      # Trigger the fake drop event
      page.execute_script <<-JS
      var e = jQuery.Event('drop', { dataTransfer : { files : [fakeFileInput.get(0).files[0]] } });
      $('.dropzone')[0].dropzone.listeners[0].events.drop(e);
      JS
      
      fill_in 'product[name]', with: 'ホーリーランス'
      fill_in 'product[description]', with: 'フィーチャスペックのテスト'
      select 'レディース', from: 'product[category_id]'
      select 'トップス', from: 'product[sub_category_id]'
      select 'Tシャツ/カットソー(半袖/袖なし)', from: 'product[sub_subcategory_id]'
      select 'XXX以下', from: 'product[size]'
      select '新品、未使用', from: 'product[status]'
      select '送料込み(出品者負担)', from: 'product[shipping_fee]'
      select '未定', from: 'product[shipping_method]'
      select '北海道', from: 'product[state]'
      select '1~2日で発送', from: 'product[shipping_day]'
      fill_in 'product[price]', with: 300
      find('[type="submit"]').click
      sleep 5;

    }.to change(Product, :count).by(1)
    .and change(ProductImage, :count).by(1)

  end

  scenario "必須項目(商品名)が無いため、出品できない", js: true do

    # #出品フォームを表示
    visit sell_path
    expect(current_path).to eq sell_path

    # 画像のドラッグ&ドロップをシュミレート
    expect {
      page.execute_script <<-JS
      fakeFileInput = window.$('<input/>').attr(
        {id: 'fakeFileInput', type:'file'}
        ).appendTo('body');
        JS
      # Attach the file to the fake input selector
      attach_file("fakeFileInput", "#{Rails.root}/public/images/no_image.jpg")
      # Add the file to a fileList array
      page.execute_script("var fileList = [fakeFileInput.get(0).files[0]]")
      # Trigger the fake drop event
      page.execute_script <<-JS
      var e = jQuery.Event('drop', { dataTransfer : { files : [fakeFileInput.get(0).files[0]] } });
      $('.dropzone')[0].dropzone.listeners[0].events.drop(e);
      JS
      
      fill_in 'product[name]', with: ''
      fill_in 'product[description]', with: 'フィーチャスペックのテスト'
      select 'レディース', from: 'product[category_id]'
      select 'トップス', from: 'product[sub_category_id]'
      select 'Tシャツ/カットソー(半袖/袖なし)', from: 'product[sub_subcategory_id]'
      select 'XXX以下', from: 'product[size]'
      select '新品、未使用', from: 'product[status]'
      select '送料込み(出品者負担)', from: 'product[shipping_fee]'
      select '未定', from: 'product[shipping_method]'
      select '北海道', from: 'product[state]'
      select '1~2日で発送', from: 'product[shipping_day]'
      fill_in 'product[price]', with: 300
      find('[type="submit"]').click
      sleep 5;

    }.to change(Product, :count).by(0)
    .and change(ProductImage, :count).by(0)

  end

end
