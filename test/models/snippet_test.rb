require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Snippet Model" do
  it 'can construct a new instance' do
    @snippet = Snippet.new
    refute_nil @snippet
  end
end
