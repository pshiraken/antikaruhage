# -*- coding: utf-8 -*-

Plugin.create(:antikaruhage) do

  DEFINED_TIME = Time.new.freeze
  
  on_appear do |ms|
    ms.each do |m|
      if m.user.idname == "karubabu" and m[:created] > DEFINED_TIME and !m.retweet?
        exptmp = m.to_s
        # mentionを弾く
        if exptmp !=~ /@[a-zA-Z0-9_]*/
          # 空の()を弾く
          exptmp = exptmp.gsub(/[\(（][\)）]/,'')
          exptmp = exptmp.gsub(/(https?|ftp):\/\/[\/A-Za-z0-9\.]*/,'')
          if exptmp =~ /^よし|しよう$|します$|では$|するね$|したい$|てみよう$|いいね|してね$|ようね$|ますね$|/ and m[:created] > DEFINED_TIME and !m.retweet?
            randtmp = rand(8) + 1
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
              reply = "だめで～す"
            when 6 then
              reply = "だめでーす"
            when 7 then
              reply = "ダメで～す"
            when 8 then
              reply = "ダメでーす"
            end
            Service.primary.post(:message => "#{"@" + m.user.idname + " " + reply}", :replyto => m)
          end
        end
      end
    end
  end
end