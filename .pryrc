Pry.config.print = -> (output, value, *args) {
#  unless defined?(ActiveRecord) && value.is_a?(ActiveRecord::Relation)
#    Pry::DEFAULT_PRINT.(output, value, *args)
#  else
    Pry::SIMPLE_PRINT.(output, value, *args)
#  end
}
def quiet
  ActiveRecord::Base.logger = Rails.logger
end
def loud
  ActiveRecord::Base.logger = Logger.new STDOUT
end
def trace
  ActiveRecordQueryTrace.enabled = true if defined? ActiveRecordQueryTrace
end
def notrace
  ActiveRecordQueryTrace.enabled = false if defined? ActiveRecordQueryTrace
end

class Object
  def pas
    each { |thing| p thing }.count
  end
  def pas2
    each { |thing| puts ; p thing }.count
  end
end

def say ; system('say -v Kare -r 99 ok go go go, go, go. Such wow biscuitheads. Múy bién. Go go go go yay.') ; end

def time &blk
  t = Time.now
  result = yield
  puts "Took #{(Time.now - t).round(1)} seconds."
  result
end

quiet
notrace
puts "👍   hi!  😜"
