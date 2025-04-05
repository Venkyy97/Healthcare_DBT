select 
	id as patient_id,
	birthdate,
	deathdate,
	race,
	ethnicity,
	gender,
	datediff('YEAR', birthdate, current_date())  as age,
	case when deathdate is not null then 1 else 0 end as is_deceased 
from {{ source('covid_raw', 'patients') }}
	
