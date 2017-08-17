module TopHelper
  def new?(date)
    now = DateTime.now
    if date > now - 3
      true
    else
      false
    end
  end
end
