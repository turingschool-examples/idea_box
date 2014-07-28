class Idea
  include Comparable

  attr_reader :id,
              :title,
              :description,
              :rank

  def initialize(attributes)
    @id          = attributes["id"]
    @title       = attributes["title"]
    @description = attributes["description"]
    @rank        = attributes["rank"] || 0
  end

  def save
    IdeaStore.create(to_h)
  end

  def to_h
    {
      "title"       => title,
      "description" => description,
      "rank"        => rank
    }
  end

  def like!
    @rank += 1
  end

  def <=>(other)
    other.rank <=> rank
  end
end
