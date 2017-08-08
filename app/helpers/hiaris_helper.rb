module HiarisHelper
  def simple_time(time)
    time.strftime("%Y-%m-%d　%H:%M　")
  end
  
  def convert2Reliability(num)
    case num
      when 1 then
        return "低"
      when 2 then
        return "中"
      when 3 then
        return "高"
      else
        return "高"
    end
  end

  def default_meta_tags
    {
      title: "ヒアリマップ",
      description: "あなたのご近所にもしかしたらヒアリがいるかもしれない。被害に会わないために、みんなで目撃情報をシェアしましょう！。ヒアリの目撃情報をグーグルマップにプロットできるサービスです。随時UPDATE中。",
      keywords: "ヒアリ,目撃,情報,マップ",
      icon: image_url("hiari.png"),
      charset: "UTF-8",
      og: {
        title: "ヒアリマップ",
        type: "website",
        url: request.original_url,
        image: image_url("OGPhiarimap.png"),
        site_name: "ヒアリマップ",
        description: "あなたのご近所にもしかしたらヒアリがいるかもしれない。被害に会わないために、みんなで目撃情報をシェアしましょう！。ヒアリの目撃情報をグーグルマップにプロットできるサービスです。随時UPDATE中。",
        locale: "ja_JP"
      }
    }
  end
end