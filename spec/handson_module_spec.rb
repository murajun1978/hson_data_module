require 'spec_helper'
require_relative 'handson_data'
include HandsonData

describe HandsonData do
  it 'ハンドソンのフォーマットに変換できる' do
    current_data = [["a"]]
    set_data = [%w(a b c)], [%w(dd), %w(ee)], [%w(f g )]
    expect(HandsonData::to_handson(current_data: current_data, set_data: set_data)).to eq [["a"],["a","b","c","dd","f","g"],[nil,nil,nil,"ee",nil,nil]]
  end
end
