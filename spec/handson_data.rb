module HandsonData
  def to_handson(current_data: [], set_data: [])
    return current_data if set_data.empty?

    # マックスレコート数を取得
    max_row = set_data.map(&:length).max

    data = []
    set_data.each_with_index do |d, i|
      # ブランク用データ
      blank_data = Array.new(d[0].length)

      # データセット
      h_data = d

      # ブランクデータセット
      h_data << blank_data * (max_row - d.length) if max_row > d.length

      if i == 0
        # 親テーブルセット
        data = h_data
      else
        # 子テーブルセット
        data = data.zip(h_data).map(&:flatten)
      end
    end

    # カレントデータとマージ
    current_data + data
  end
end
