class SortedArray
  attr_reader :internal_arr

  def initialize arr=[]
    @internal_arr = []
    arr.each { |el| add el }
  end
  
  def add el
    # we are going to keep this array
    # sorted at all times. so this is ez
    lo = 0
    hi = @internal_arr.size
    # note that when the array just
    # starts out, it's zero size, so
    # we don't do anything in the while
    # otherwise this loop determines
    # the position in the array, *before*
    # which to insert our element
    while lo < hi
      # let's get the midpoint
      mid = (lo + hi) / 2
      if @internal_arr[mid] < el
        # if the middle element is less 
        # than the current element
        # let's increment the lo by one
        # from the current midway point
        lo = mid + 1
      else
        # otherwise the hi *is* the midway 
        # point, we'll take the left side next
        hi = mid 
      end
    end
    # insert at the lo position
    @internal_arr.insert(lo, el)
  end

  def each &block
    #u want to have an index
    #loop over all elements in internal array.
    #yield to each element
    i= 0 #keep track of our index
    while i < @internal_arr.size
      yield @internal_arr[i]
      i+= 1
    end
    return @internal_arr
  end

  def map &block
        #get input array
        #make new array
        # #call each on new array
        # pass block
        # @internal_arr
        new_array= @internal_arr.dup
         return new_array.each &block
  end

  def map! &block
    @internal_arr= self.each &block
  end

  def find &block
    #if the result of the block is true, exit the array , return the value of array[i]
    z=nil
    #self.each {|x| return x if yield(x)}

    self.each do |x| 
      if yield x 
        z = x
        break
      end
    end
    return z 
  end

  def inject acc=nil, &block
    #iterate over array, while keeping track of a var
    array.inj
    raise NotImplementedError.new("You need to implement the inject method!")
  end
end
