# frozen_string_literal: true

def read_char
  begin
    old_state = `stty -g`
    system "stty raw -echo"
    c = STDIN.getc.chr
    if c == "\e"
      extra_thread = Thread.new {
        c += STDIN.getc.chr + STDIN.getc.chr
      }
      extra_thread.join(0.00001)
      extra_thread.kill
    end
  ensure
    system "stty #{old_state}"
  end
  c
end

class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end
