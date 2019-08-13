[h1]Description[/h1]

This mods lets you configure units immunities. It can be Aliens, ADVENT or even your soldier.
I have started this mod wanting to add immunities to rulers, and it was the Avatar after that. Then I realized this feature could be used by others for any unit.

[h1]Changes[/h1]

None. This is meant to be used by other mods.
You can tweak [u]XComImmunities.ini[/u] as you wish and share your changes.

[h1]Variables[/h1]

[u]TemplateName[/u] - [i]String[/i]
[b]Required[/b] - Name of the unit being modified.

[u]RemoveOriginalImmunity[/u] - [i]Boolean[/i]
[b]Optional[/b] - If set to true will remove original immunities from the unit.

[u]AddImmunityName[/u] - [i]Array (string)[/i]
[b]Optional[/b] - Immunity names you want to add to the unit.

[u]RemoveImmunityName[/u] - [i]Array (string)[/i]
[b]Optional[/b] - Immunity names you want to remove from the unit.

[h1]Examples[/h1]

[code]
[ConfigurableImmunities.OPTC_CharactersImmunities]
; Examples

; Will make Soldier units immune to Fire
;+CharacterImmunities = (TemplateName=Soldier, RemovePreviousImmunity=false, ImmunityName[0]=Fire)

; Will remove immunities from Soldier units
;+CharacterImmunities = (TemplateName=Soldier, RemovePreviousImmunity=true)
[/code]

[h1]Note[/h1]

Some enemy units have some built in immunities as abilities. You won't be able to modify those with this mod.

[h1]Troubleshooting[/h1]
[url=steamcommunity.com/sharedfiles/filedetails/?id=683218526]Mods not working properly / at all[/url]
[url=steamcommunity.com/sharedfiles/filedetails/?id=625230005]Mod not working? Mods still have their effects after you disable them?[/url]

tags= War of the Chosen, Gameplay, Config

