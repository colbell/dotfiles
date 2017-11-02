IEx.configure(
  history_size: 500,
  inspect: [limit: :infinity, pretty: true, charlists: :as_lists],
  default_prompt:
  "#{IO.ANSI.green}%prefix#{IO.ANSI.reset}" <>
    "[#{IO.ANSI.cyan}%counter#{IO.ANSI.reset}]>",
  alive_prompt:
  "#{IO.ANSI.green}%prefix#{IO.ANSI.reset}" <>
    "(#{IO.ANSI.yellow}%node#{IO.ANSI.reset})" <>
    "[#{IO.ANSI.cyan}%counter#{IO.ANSI.reset}]>",
)

# Add to a project specific .iex.exs
# File.exists?(Path.expand("~/.iex.exs")) && import_file("~/.iex.exs")

# import Ecto.Query

# alias Project.Repo

# alias Project.User
# alias Project.Post
