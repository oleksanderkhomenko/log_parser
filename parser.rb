class Parser
  def initialize(filename = '')
    raise 'Invalid file' unless File.exists?(filename)
    file = File.readlines filename
    @links = file.map { |link| link.split.first }
    @uniq_links = file.uniq.map { |link| link.split.first }
  end

  def visits
    Parser.group_and_sort(@links).join(' visits ')
  end

  def uniq_visits
    Parser.group_and_sort(@uniq_links).join(' unique views ')
  end

  def self.group_and_sort(links)
    links.uniq.map do |link|
      [link, links.count(link)]
    end.sort_by do |visit|
      visit.last
    end.reverse.map {|visit| visit.join (' ')}
  end

end
