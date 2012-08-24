class User

  @@users, @@id = [], 0
  attr_accessor :name, :age, :job
  attr_reader :id

  def initialize(name, age, job)
    @@id += 1
    @id, @name, @age, @job = @@id, name, age, job
    @@users << self
  end

  def to_s
    "%d:%s(%d/%s)" % [id, name, age, job]
  end

  class << self
    def all
      @@users
    end

    %w(id name age job).each do |m|
      define_method("find_by_#{m}") do |arg|
        blk = lambda{|usr| usr.send(m) == arg }
        meth = [:id, :name].include?(m) ? :detect : :select
        @@users.send(meth, &blk)
      end
    end

    def register(&blk)
      instance_eval &blk
    end

    alias :add :new

  end

end
