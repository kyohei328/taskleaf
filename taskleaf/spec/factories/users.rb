FactoryBot.define do
    # factory :user do
    factory :admin_user, class: User do #ファクトリ名とクラス名が異なる場合、:classオプションでクラスを指定
        name {'テストユーザー'}
        email {'test1@example.com'}
        password {'password'}
    end
end