class MembersController < ApplicationController
def new
  @member = Member.new
end  
def index
	@members = Member.all
end
def prints
userinput = []
people = []
spouses = []
netpeople = []
gift = []
firstperson = []
firstperson = Member.pluck(:input)
secondperson = []
secondperson = Member.pluck(:spouse)
marriages = {}
marriages[firstperson] = secondperson
marriages = marriages.delete_if { |key, value| value.to_s.strip == '' }
	person = []
person = Member.pluck(:input)
persongift = []
persongift = Member.pluck(:gifttext)
spouse = []
spouse = Member.pluck(:spouse)
spousegift = []
spousegift = Member.pluck(:spousegift)
people = person + spouse
people = people.reject { |c| c.empty? }
gifts = persongift + spousegift
gifthash = {}
gifthash = Hash[people.zip gifts]
people = people.shuffle
originalshuffle = people
dataone = []
datatwo = []
backup = people
peoplelength = people.length
peopleuniqlength = people.uniq.length
i = peoplelength
u = peopleuniqlength
hashone = {}
myarray = []
itemonearray = []
itemtwoarray = []
if i % 2 == 0
	if people.uniq.length == people.length
		until i == 0 do
		itemone = people[0]
		dataone = dataone.push(itemone)
		hashone[itemone] = nil
		itemtwo = people[1]
		datatwo = datatwo.push(itemtwo)
		itemonearray = itemonearray.push(itemone)
		itemtwoarray = itemtwoarray.push(itemtwo)
		hashone[itemone] = itemtwo
			if marriages[itemone] != itemtwo && marriages[itemtwo] != itemone && itemonearray[-1] != marriages[itemtwo] && itemtwoarray[-1] != marriages[itemone]
				myvar = "#{itemone} is a match for #{itemtwo}. #{itemtwo} would like #{gifthash[itemtwo]}."
				myarray = myarray.push(myvar)
				people = people.drop(2)
				i -= 2
			else
				people = backup
				myarray = []
				itemonearray = []
				itemtwoarray = []
				i = peoplelength
				people = people.shuffle
				hashone = Hash.new
				dataone = []
				datatwo = []
			end
		end
backupdataone = dataone
backupdatatwo = datatwo
dataonelength = dataone.length
datatwolength = datatwo.length
x = dataonelength + datatwolength
mysecondarray = []
itemonearray = []
itemtwoarray = []
dataone = dataone.shuffle
datatwo = datatwo.shuffle
		until x == 0 do
itemone = datatwo[0]
itemtwo = dataone[0]
itemonearray = itemonearray.push(itemone)
itemtwoarray = itemtwoarray.push(itemtwo)
		if itemone != itemtwo && hashone[itemone] != hashone.values_at(itemone) && marriages[itemone] != itemtwo && marriages[itemtwo] != itemone && itemtwoarray[-1] != marriages[itemone] && itemonearray[-1] != marriages[itemtwo]

		myvar = "#{itemone} is a match for #{itemtwo}. #{itemtwo} would like #{gifthash[itemtwo]}."
		mysecondarray = mysecondarray.push(myvar)
		datatwo = datatwo.drop(1)
		x -= 1
		dataone = dataone.drop(1)
		x -= 1
		else
		itemonearray = []
		itemtwoarray = []
			dataone = backupdataone
			datatwo = backupdatatwo
			dataone = dataone.shuffle
			datatwo = datatwo.shuffle
			x = dataonelength + datatwolength
			mysecondarray = []
		end
		end
		finalarray = myarray + mysecondarray
	else
	finalarray = ["Duplicate name. Please try again.", ""]
	end
else
	finalarray = ["Please enter an even number of names.", ""]
end
return finalarray
end
def create
   @member = Member.new(member_params)
if @member.save
  redirect_to :action => 'new'
else
  render :action => 'new'
end
end
def show
end
def results
	@matches = prints
end
def member_params
      params.require(:member).permit(:input, :gifttext, :spouse, :spousegift)
end
end