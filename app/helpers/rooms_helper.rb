module RoomsHelper
  def count_talks(room)
    room.talks.count
  end
end
