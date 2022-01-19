class WelcomeController < ApplicationController
before_action :horaire, only: [:index]
  def index

  end
private
def horaire
@now=DateTime.now.localtime

@today=@now
@tomorrow=(@now+1.day).to_datetime.localtime
@midnight = @today.beginning_of_day
@h19 = @midnight+19.hour
@h16 = @midnight+16.hour
@h12m30 = @midnight+12.hour+30.minute
@h8 = @midnight+8.hour
@h8tomorrow = @tomorrow.to_time+8.hour

@nextmidnight = @tomorrow.beginning_of_day
@Wdemain=[1,2,3,4,5,7]
@jouvres=[1,2,3,4,5,6]
@finsem=[6]
@finwe=[7]
@list=[[@Wdemain, @h19, @nextmidnight,"Ouvre à 08:00 demain"],
[@jouvres,@midnight, @h8, "Ouvre ce matin à 08:00"],
[@finsem,@h19, @nextmidnight, "Fermé demain"],
[@finwe,@midnight, @h19, "Fermé aujourd'hui, ouvre à 08:00 demain"],
[@jouvres,@h8, @h12m30, "Ouvert jusqu'à 12:30"],
[@jouvres,@h12m30,@h16, "Ouvre à 16:00 cet après-midi"],
[@jouvres,@h16,@h19, "Ouvert jusqu'à 19:00"]
]
@list.each do |joursem,debut,fin,msg|

wday=@now.strftime('%u').to_i
p @now
p wday
if joursem.include?(wday) && @now.between?(debut, fin)
@msg=msg
end
end
#demain ouvert
#demain ferme
end
end
