module Enumerable

  def my_each
    i = 0

    while i < self.length
      yield(self[i])
      i += 1
    end

    self
  end

  def my_each_with_index
    i = 0

    while i < self.length
      yield(self[i], i)
      i += 1
    end

    self
  end

  def my_select
    select = []

    self.my_each do |i|
      if yield(i)
        select << i
      end
    end

    select
  end

  def my_all?
    all = true

    self.my_each do |i|
      all = false unless yield i
    end

    all
  end

  def my_any?
    any = false

    self.my_each do |i|
      any = true if yield i
    end

    any
  end

  def my_none?
    none = false

    self.my_each do |i|
      none = true unless yield i
    end

    none
  end

  def my_count(*count)
    if block_given?
      self.my_select { |i| yield i }.length

    elsif count.length == 1
      self.my_select { |i| i == 0 }.length

    else
      self.length
    end

  end

  def my_map(&proc)
    map = []

    (self.length).times do |i|
      map << (proc.call self[i])
    end

    map
  end
end
