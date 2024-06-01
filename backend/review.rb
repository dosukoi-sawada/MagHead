require 'optparse'

DEFAULT_BRANCH = "main".freeze

def main
  opt = OptionParser.new
  option = {}
  opt.on('-c', '--commit') {|v| option[:commit] = v}
  opt.on('-n', '--n_plus_one') {option[:n_plus_one] = true}
  opt.on('-s', '--spell') {option[:spell] = true}
  opt.on('-n', '--nil_care') {option[:nil_care] = true}
  opt.on('-w', '--wrong_comment') {option[:nil_care] = true}
  opt.on('-d', '--dead_code') {option[:dead_code] = true}
  arg = opt.parse!(ARGV)

  script = "以下にコードの差分を示すので、これに対してレビューをお願いします。\n"
  
  script += "n+1問題が発生していないかチェックをお願いします。\n" if option[:n_plus_one]
  script += "日本語が記述されている箇所について、スペルミスがないかチェックをお願いします。\n" if option[:spell]
  script += "nilが返ってくる可能性がある箇所について、nilガードがされているかチェックをお願いします。\n" if option[:nil_care]
  script += "コメントとコードで矛盾している箇所がないかチェックをお願いします。\n" if option[:wrong_comment]
  script += "デッドコードや意味のないコメントアウトが残っていないかチェックをお願いします。\n" if option[:dead_code]
  
  script += "```txt\n"
  diff = ""

  if option[:commit]
    diff = diff_between_commits(arg[0])
  else
    current_branch = `git rev-parse --abbrev-ref HEAD`
    diff = diff_between_branches(DEFAULT_BRANCH, current_branch)
  end

  script += "\n#{diff}"
  script += "\n```"
  puts script
end

def diff_between_branches(base_branch, target_branch)
  `git diff #{base_branch}...#{target_branch}`
end

def diff_between_commits(target_commit)
  `git diff #{target_commit}^!`
end

main