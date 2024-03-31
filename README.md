# What is LRU Cache?
Cache replacement algorithms are designed to replace the cache when the space is full. The Least Recently Used (LRU) is one of those algorithms. As the name suggests when the cache memory is full, LRU picks the data that is least recently used and removes it in order to make space for the new data. The priority of the data in the cache changes according to the need of that data i.e. if some data is fetched or updated recently then the priority of that data would be changed and assigned to the highest priority, and the priority of the data decreases if it remains unused operations after operations.

# Implementation Description

- This implementaion is using a fixed length array as the cache.
- Postition of the item in the cache determines its recency
   - last element is the most recently use item
   - the cache will not have duplicate items

### Scenarios
- When space is available
   - add a new item to the last item in the cache
   - item is already in array
     - move item from its current location to end of the cache

- When space is not available
   - remove the first item in the cache array
   - add new item to the end of the array

