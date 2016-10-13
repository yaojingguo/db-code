class SimpleTDescriber < Innodb::RecordDescriber
  type :clustered
  key "i", :INT, :UNSIGNED, :NOT_NULL
end
