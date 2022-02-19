IRB.conf[:AUTO_INDENT] = true
#IRB.conf[:USE_SINGLELINE] = true
IRB.conf[:ECHO_ON_ASSIGNMENT] = true
IRB.conf[:ECHO] = true
IRB.conf[:IRB_NAME] = RUBY_VERSION

def time &blk
  t = Time.now
  result = blk.call if block_given?
  p "Took #{(Time.now - t).round(4)} seconds."
  result
end

module Enumerable
  def count_by &blk ; if block_given? ; gps = group_by &blk ; gps.reduce({}) {|memo, (k, vs)| memo.merge({ k => vs.count }) } ; else ; to_enum(:count_by) ; end ; end
  def counts ; count_by {|x|x} ; end
end

puts "✨💜✨"
