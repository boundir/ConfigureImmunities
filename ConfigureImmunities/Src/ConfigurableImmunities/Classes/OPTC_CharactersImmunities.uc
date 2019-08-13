class OPTC_CharactersImmunities extends X2DownloadableContentInfo config(Immunities);

struct native CharacterImmunityNames
{
	var Name TemplateName;
	var array<Name> AddImmunityName;
	var array<Name> RemoveImmunityName;
	var bool RemoveOriginalImmunity;
};

var config array<CharacterImmunityNames> CharacterImmunities;

static event OnPostTemplatesCreated()
{
	local X2CharacterTemplateManager CharacterMgr;
	local array<X2DataTemplate> TemplateAllDifficulties;
	local X2DataTemplate Template;
	local X2CharacterTemplate CharacterTemplate;
	
	local CharacterImmunityNames CharacterConfig;
	local Name ImmunityName;

	`LOG("Configure Immunities loaded");

	CharacterMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();

	foreach default.CharacterImmunities(CharacterConfig)
	{
		CharacterMgr.FindDataTemplateAllDifficulties(CharacterConfig.TemplateName, TemplateAllDifficulties);

		foreach TemplateAllDifficulties(Template)
		{
			CharacterTemplate = X2CharacterTemplate(Template);

			if (CharacterTemplate != none)
			{
				if(CharacterConfig.RemoveOriginalImmunity)
				{
					CharacterTemplate.ImmuneTypes.length = 0;
					`LOG("Configure Immunities : Removed previous immunities from" @ CharacterConfig.TemplateName );
				}

				foreach CharacterConfig.AddImmunityName(ImmunityName)
				{
					switch(ImmunityName)
					{
						case 'ParthenogenicPoison':
							CharacterTemplate.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
							break;
						case 'Knockback':
							CharacterTemplate.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.KnockbackDamageType);
							break;
						default:
							CharacterTemplate.ImmuneTypes.AddItem(ImmunityName);
							break;
					}
					
					`LOG("Configure Immunities : Added" @ ImmunityName @ "immunity to" @ CharacterConfig.TemplateName );
				}

				foreach CharacterConfig.RemoveImmunityName(ImmunityName)
				{
					switch(ImmunityName)
					{
						case 'ParthenogenicPoison':
							CharacterTemplate.ImmuneTypes.RemoveItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
							break;
						case 'Knockback':
							CharacterTemplate.ImmuneTypes.RemoveItem(class'X2Item_DefaultDamageTypes'.default.KnockbackDamageType);
							break;
						default:
							CharacterTemplate.ImmuneTypes.RemoveItem(ImmunityName);
							break;
					}
					
					`LOG("Configure Immunities : Removed" @ ImmunityName @ "immunity from" @ CharacterConfig.TemplateName );
				}
				
			}
		}
	}
}

