class Corrector
  def correct_name(name)
    name.capitalize!
    name[0..9]
  end
end
