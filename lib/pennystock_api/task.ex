defmodule PennystockApi.Task do
  def work do
    IO.inspect("Cron is running: #{Timex.now()}")
  end
end
