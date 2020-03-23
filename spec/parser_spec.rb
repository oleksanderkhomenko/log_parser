require_relative '../parser'

RSpec.describe Parser do
  let(:invalid_parser) { Parser.new('no file') }
  let(:parser) { Parser.new('spec/test.log') }

  describe '#sort_lines' do
    context 'success' do
      it 'sort visits' do
        expect(parser.visits).to eq('/about/2 7 visits /index 6 visits /contact 5 visits /help_page/1 4 visits /about 3 visits /home 2')
      end

      it 'sort uniq visits' do
        expect(parser.uniq_visits).to eq('/about/2 6 unique views /index 4 unique views /help_page/1 3 unique views /about 3 unique views /contact 2 unique views /home 1')
      end

      it 'check count of links and unique links' do
        links = parser.instance_variable_get(:@links)
        uniq_links = parser.instance_variable_get(:@uniq_links)
        expect(Parser.group_and_sort(links).count).to eq(Parser.group_and_sort(uniq_links).count)
      end
    end

    context 'failure' do
      it 'render error' do
        expect { invalid_parser }.to raise_error('Invalid file')
      end
    end
  end
end
