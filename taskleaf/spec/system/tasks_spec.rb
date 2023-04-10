require 'rails_helper'

describe 'タスク管理機能', type: :system do
    describe '一覧表示機能' do
        before do
            #ユーザーAを作成しておく
            # user_a = FactoryBot.create(:user)
            user_a = FactoryBot.create(:admin_user, name: 'ユーザーA', email: 'a@example.com') #別のユーザーを扱う際にスムーズになように一部の属性変更
            #作成者がユーザーAであるタスクを作成しておく
            FactoryBot.create(:task, name: '最初のタスク', user: user_a)
        end
        
        context 'ユーザーAがログインしているとき' do
            before do
                #ユーザーAでログインする
                visit login_path #ログイン画面にアクセスする
                fill_in 'メールアドレス', with: 'a@example.com' #メールアドレスを入力する
                fill_in 'パスワード', with: 'password' #パスワードを入力する
                click_button 'ログインする' #「ログインする」ボタンを押す

            end

            it 'ユーザーAが作成したタスクが表示される' do
                #作成済みのタスク名称が画面上に表示されていることを確認
                expect(page).to have_content '最初のタスク'
            end
        end
    end
end