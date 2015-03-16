# -*- coding: utf-8 -*-

Plugin.create(:antikaruhage) do

  DEFINED_TIME = Time.new.freeze
  
  on_appear do |ms|
    ms.each do |m|
      if m.user.idname == "K1N0Sh1T4"
        exptmp = m.message.to_s
        # @screen_nameを弾く
        exptmp = exptmp.gsub(/@[a-zA-Z0-9_]*/,'')
        # 空の()を弾く
        exptmp = exptmp.gsub(/[\(（][\)）]/,'')
        exptmp = exptmp.gsub(/(https?|ftp):\/\/[\/A-Za-z0-9\.]*/,'')
        if exptmp =~ /^よし|しよう$|します$|では$|いいね/ and m[:created] > DEFINED_TIME and !m.retweet?
          Service.primary.post(:message => "#{"@karubabu" + ' ' + "だめ"}", :replyto => m)
        end
      end
    end
  end
end