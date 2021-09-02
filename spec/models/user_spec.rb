require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end  

  describe "ユーザー新規登録" do
    context "新規登録がうまくいく時" 
     it "全て入力値が正しい場合登録ができる" do
     expect(@user).to be_valid
     end
   end

   context "新規登録がうまくいかない時" do
    it "emailが空だと登録できない" do
      @user.email =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end  

    it "nameが空だと登録できない" do
      @user.name =''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end  
    
    it "name_readingが空だと登録できない" do
      @user.name_reading =''
      @user.valid?
      expect(@user.errors.full_messages).to include("フリガナを入力してください")
    end  

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end  

    it "emailに@を含まないと登録できない" do
      @user.email ='testcom'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end  

    it "passwordが空だと登録できない" do
      @user.password =''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end  

    it "passwordは6文字以上でないと登録できない" do
      @user.password ='12'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end  

    it "passwordは、半角英数字混合でないと登録できない" do
      @user.password ='aaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end  

    it "passwordは、数字のみの時登録できない" do
      @user.password ='1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end  

    it "passwordが全角の時登録できない" do
      @user.password ='１１１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end  

    it "パスワードとパスワード（確認）は、値の一致してないと登録できない" do
      @user.password ='123456a'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end  

    it "名前は漢字・ひらがな・カタカナ以外では登録できない" do
      @user.name ='aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は不正な値です")
    end  

    it "名前の読み仮名は全角カタカナ以外では登録できない" do
      @user.name_reading='ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("フリガナは不正な値です")
    end  

    it "addressが空だと購入できない" do
      @user.address = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("住所を入力してください")
    end

    it "datetimeがない場合は登録できない" do
      @user.datetime = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end

    it "body_weightが空だと購入できない" do
      @user.body_weight = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("体重を入力してください")
    end

    it "heightが空だと購入できない" do
      @user.height = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("身長を入力してください")
    end

    it "body_temperatureが空だと購入できない" do
      @user.body_temperature = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("体温を入力してください")
    end

    it "blood_type_idが選択されてないと登録できない" do
      @user.blood_type_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("血液型を選択してください")
    end

    it "allergy_idが選択されてないと登録できない" do
      @user.allergy_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("アレルギーの有無を選択してください")
    end

    it "chronic_condition_idが選択されてないと登録できない" do
      @user.chronic_condition_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("持病の有無を選択してください")
    end

    it "venue_idが選択されてないと登録できない" do
      @user.venue_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("会場を選択してください")
    end

    it '血液型のアクティブハッシュのカラムが１では登録できない' do
      @user.blood_type_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("血液型を選択してください")
    end

    it 'アレルギーの有無のアクティブハッシュのカラムが１では登録できない' do
      @user.allergy_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("アレルギーの有無を選択してください")
    end

    it '持病の有無のアクティブハッシュのカラムが１では登録できない' do
      @user.chronic_condition_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("持病の有無を選択してください")
    end

    it '会場のアクティブハッシュのカラムが１では登録できない' do
      @user.venue_id= 1
      @user.valid?
      expect(@user.errors.full_messages).to include("会場を選択してください")
    end

    it "public_uidが空では購入できない" do
      @user.public_uid = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Public uidを入力してください")
    end

   end 

end
