class SLOT

GIVE_POINT = 500

  def initialize
    #コイン数
    @coin = 100
    #ポイント
    @point = 0
  end

  #下線描画
  def kasen
    puts "----------------------"
  end

  #導入
  def intro
    kasen
    puts "残りコイン数#{@coin}"
    puts "ポイント#{@point}"
    puts "何コイン入れますか？"
    puts "1(10コイン)2(30コイン)3(50コイン)4やめとく"
    kasen
  end

  #コイン投入
  def input_coin
    #スロット実施して良いかのチェック（trueで初期化）
    @check = "true"
    @input_coin_select = gets.to_i
    case @input_coin_select
      when 1
        if @coin >= 10
          @coin -= 10
          puts "エンターを3回押しましょう!"
        else
          puts "コインが足りません"
          gameover
        end
      when 2
        if @coin >= 30
        @coin -= 30
        puts "エンターを3回押しましょう!"
      else
        puts "コインが足りません"
        @check = "false"
      end
      when 3
        if @coin >= 50
        @coin -= 50
        puts "エンターを3回押しましょう!"
      else
        puts "コインが足りません"
        @check = "false"
      end
      when 4
        @coin -= 0
        puts "コインを投入しませんでした"
        puts "ゲームをやめますか？"
        puts "1(はい)2(いいえ)"
        quit = gets.to_i
        if quit == 1
          puts "あなたが獲得したコインは#{@coin}、ポイントは#{@point}でした"
          @coin = 0
        elsif quit == 2
          puts "ゲームを続けます"
        else
          puts "1か2を選んでください"
        end
      else
        puts "1~4から選択してください"
      end
  end

  #スロット左
  def slot_left
    if puts = gets
      @num1 = rand(9)
      @num2 = rand(9)
      @num3 = rand(9)
      puts "|#{@num1}| | |"
      puts "|#{@num2}| | |"
      puts "|#{@num3}| | |"
      kasen
    end
  end

  #スロット中央
  def slot_center
    if puts = gets
      @num4 = rand(9)
      @num5 = rand(9)
      @num6 = rand(9)
      puts "|#{@num1}|#{@num4}| |"
      puts "|#{@num2}|#{@num5}| |"
      puts "|#{@num3}|#{@num6}| |"
      kasen
    end
  end

  #スロット右
  def slot_right
    if puts = gets
      @num7 = rand(9)
      @num8 = rand(9)
      @num9 = rand(9)
      puts "|#{@num1}|#{@num4}|#{@num7}|"
      puts "|#{@num2}|#{@num5}|#{@num8}|"
      puts "|#{@num3}|#{@num6}|#{@num9}|"
      kasen
      condition
    end
  end

  def give
    point_get_message = "500ポイント獲得!"
    case @input_coin_select
    when 1
      puts point_get_message
      puts "100コイン獲得!"
      @point += GIVE_POINT
      @coin += 100
    when 2
      puts point_get_message
      puts "300コイン獲得!"
      @point += GIVE_POINT
      @coin += 300
    when 3
      puts point_get_message
      puts "500コイン獲得!"
      @point += GIVE_POINT
      @coin += 500
    else
      puts "エラーが発生しました"
    end
  end

  #条件分岐
  def condition
    if @num1 == @num2 && @num2 == @num3
      puts "左に#{@num1}が揃いました"
      give
    end
    if @num4 == @num5 && @num5 == @num6
      puts "真ん中に#{@num4}が揃いました"
      give
    end
    if @num7 == @num8 && @num8 == @num9
      puts "右に#{@num7}が揃いました"
      give
    end
  end

  #ゲームオーバー
  def gameover
    puts "ゲームオーバー"
  end

  #メインメソッド
  def main
    while @coin > 0 do
      intro
      input_coin
      if @input_coin_select == 1 || @input_coin_select == 2 || @input_coin_select == 3
        if @check == "true"
          slot_left
          slot_center
          slot_right
        end
      end
    end
    gameover
  end

end

s = SLOT.new
s.main()
