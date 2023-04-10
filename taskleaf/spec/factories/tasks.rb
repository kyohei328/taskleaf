FactoryBot.define do
    factory :task do
        name {'テストを書く'}
        description {'RSpec & Capybara & FactoryBotを準備する'}
        # user user.rbで定義した:userとtaskモデルで定義されたuserの関連を生成に利用
        association :user, factory: :admin_user #関連名と異なる場合の記述方法
    end
end