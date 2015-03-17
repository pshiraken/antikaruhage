# -*- coding: utf-8 -*-

Plugin.create(:antikaruhage) do

  DEFINED_TIME = Time.new.freeze
  
  on_appear do |ms|
    ms.each do |m|
      if m.user.idname == "karubabu" and m[:created] > DEFINED_TIME and !m.retweet?
        if m.body =~ /^よし|しよう$|します$|では$|するね$|したい$|てみよう$|いいね|してね$|ようね$|ますね$/
          # mentionを弾く
          if m.body !=~ /@[a-zA-Z0-9_]*/
            randtmp = rand(7) + 1
            case randtmp
            when 1 then
              reply = "だめ"
            when 2 then
              reply = "だめです"
            when 3 then
              reply = "ダメ"
            when 4 then
              reply = "ダメです"
            when 5 then
              reply = "だめ\n"
            when 6 then
              reply = "だめ\r"
            when 7 then
              reply = "だめ\r\n"
            end
            Service.primary.post(:message => "#{"@" + m.user.idname + " " + reply}", :replyto => m)
          end
        end
      end
    end
  end
end