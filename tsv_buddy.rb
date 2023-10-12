# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    rows = tsv.split("\n").map { |line| line.split("\t") }
    headers = rows.first
    data_rows = rows[1..]
    @data = data_rows.map { |row| row_to_table(headers, row) }
  end

  def to_tsv
    # record = "#{@data.first.keys.join("\t")}\n"
    # record2 = @data.map { |row| "#{row.values.join("\t")}\n" }
    # record + record2.join
    record2 = @data.map {|row| row.values.join("\t") + "\n" }
    record = @data.first.keys.join("\t") + "\n"
    record + record2.join
  end

  def row_to_table(headers, row)
    row.map.with_index { |cell, i| [headers[i], cell] }.to_h
  end
end
