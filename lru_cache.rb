class LeastRecentlyUsed
  MAX_SIZE = 5

  attr_reader :cache
  def initialize(cache: [])
    @cache = cache
  end

  def get_item(item)
    remove_item(item)
    add_item(item)

    item
  end

  private

  def add_item(item)
    remove_oldest_item if cache_at_capacity?

    @cache.append(item)
  end

  def remove_item(item)
    @cache.delete(item)
  end

  def cache_at_capacity?
    @cache.length >= MAX_SIZE
  end

  def remove_oldest_item
    remove_item(@cache[0])
  end
end
