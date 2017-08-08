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
end