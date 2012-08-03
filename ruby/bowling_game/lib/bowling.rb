# -*- coding: utf-8 -*-

class Bowling
  def initialize(data)
    @throws = data.split ','
  end

  def total
    total = []
    first = 0
    second = 0
    frame.reverse.each_with_index do |f, i|
      if i == 0
        total << f.inject(:+)
        first = f[0]
        second = f[1]
        next
      end

      if f[0] == 10
        total <<  10 + first + second
        second = first
        first = f[0]
      elsif f.inject(:+) == 10
        total << 10 + first
        first = f[0]
        second = f[1]
      else
        total << f.inject(:+)
        first = f[0]
        second = f[1]
      end
    end

    return total.inject(:+)
  end

  def valid?
    frame.count == 10
  end

  def frame
    frames = []
    first = nil
    @throws.each do |t|
      case t.to_i
        when 10
        frames << [t.to_i, nil]
        else
        if first.nil?
          first = t
        else
          frames << [first.to_i, t.to_i]
          first = nil
        end
      end
    end

    if frames[9] && first
      frames[9] << first.to_i
    end

    if frames[10] || frames[11]
      frames[9] << frames[10] << frames[11]
      frames[9] = frames[9].flatten.compact
      frames = frames.slice 0..9
    end

    frames
  end

end
