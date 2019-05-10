require 'rails_helper'

feature "出品投稿" do
  background do
      Category.create(name: "レディース", main_category_id: 1)
      Category.create(name: "トップス", main_category_id: 1, sub_category_id: 1,size_flag: 1, product_size_id: 1, brand_flag: 1)
      Category.create(name: "Tシャツ/カットソー(半袖/袖なし)", main_category_id: 1, sub_category_id: 1, sub_subcategory_id: 1)
      ProductSize.create(name: "XXX以下", product_size_id: 1)
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
      select 'XXX以下', from: 'product[product_size_id]'
      select '新品、未使用', from: 'product[status_id]'
      select '送料込み(出品者負担)', from: 'product[shipping_fee_id]'
      select '未定', from: 'product[shipping_method_id]'
      select '北海道', from: 'product[state_id]'
      select '1~2日で発送', from: 'product[shipping_day_id]'
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
      select 'XXX以下', from: 'product[product_size_id]'
      select '新品、未使用', from: 'product[status_id]'
      select '送料込み(出品者負担)', from: 'product[shipping_fee_id]'
      select '未定', from: 'product[shipping_method_id]'
      select '北海道', from: 'product[state_id]'
      select '1~2日で発送', from: 'product[shipping_day_id]'
      fill_in 'product[price]', with: 300
      find('[type="submit"]').click
      sleep 5;

    }.to change(Product, :count).by(0)
    .and change(ProductImage, :count).by(0)

  end

end

feature "商品削除" do
  background do
    Category.create(name: "レディース", main_category_id: 1)
    Category.create(name: "トップス", main_category_id: 1, sub_category_id: 1,size_flag: 1, product_size_id: 1, brand_flag: 1)
    category = Category.create(name: "Tシャツ/カットソー(半袖/袖なし)", main_category_id: 1, sub_category_id: 1, sub_subcategory_id: 1)
    product_size = ProductSize.create(name: "XXX以下", product_size_id: 1)
    ProductShippingFee.create(name: "送料込み(出品者負担)")
    ProductShippingMethod.create(name: "未定", shipping_fee_category: 1)
    brand = Brand.create(name: "ゲラルディーニ")
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product,user_id: user.id,category_id: category.id,product_size_id: product_size.id,brand_id: brand.id)
    4.times{ FactoryBot.create(:product_image,product_id: product.id) }
  end
  scenario "正常に削除できる" do
    #商品詳細ページを表示
    visit '/products/1'
    expect(current_path).to eq '/products/1'

    expect{
    #「この商品を削除する」をクリック
    click_on('この商品を削除する')
    #アラートの表示確認とOKをクリック
    expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか？"
    page.driver.browser.switch_to.alert.accept
    sleep 5
    }.to change(Product, :count).by(-1)
    .and change(ProductImage, :count).by(-4)
  end

end