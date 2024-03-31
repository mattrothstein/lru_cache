require 'rspec'
require './lru_cache.rb'

RSpec.describe LeastRecentlyUsed do
  let(:item) { 'test' }
  subject { LeastRecentlyUsed.new(cache: cache) }


  describe 'get_item' do
    context 'when the cache does not contain the item' do
      context 'and the cache has space' do
        let(:cache) { ['a', 'b'] }

        it 'returns the item from the cache' do
          expect(subject.get_item(item)).to eq(item)
        end

        it 'positions the item at the end of the cache' do
          result = subject.get_item('item for the cache')
          expect(result).to eq(subject.cache.last)
        end
      end

      context 'and the cache has no space' do
        let(:cache) { ['a', 'b', 'c', 'd', 'e'] }

        it 'returns the item from the cache' do
          expect(subject.get_item(item)).to eq(item)
        end

        it 'positions the item at the end of the cache' do
          result = subject.get_item(item)
          expect(result).to eq(subject.cache.last)
        end

        it 'maintains the size limit of the cache' do
          expect do
            subject.get_item(item)
          end.to_not change(cache, :length)
        end
      end
    end

    context 'when the cache contains the item' do
      context 'and the cache has space' do
        let(:cache) { [item, 'a', 'b'] }

        it 'returns the item from the cache' do
          expect(subject.get_item(item)).to eq(item)
        end

        it 'positions the item at the end of the cache' do
          result = subject.get_item(item)
          expect(result).to eq(subject.cache.last)
        end
      end

      context 'and the cache has no space' do
        let(:cache) { [item, 'a', 'b', 'c', 'd'] }

        it 'returns the item from the cache' do
          expect(subject.get_item(item)).to eq(item)
        end

        it 'positions the item at the end of the cache' do
          result = subject.get_item(item)
          expect(result).to eq(subject.cache.last)
        end

        it 'maintains the size limit of the cache' do
          expect do
            subject.get_item(item)
          end.to_not change(cache, :length)
        end
      end
    end
  end
end
