{# we can set configs here instead of in dbt_project.yml #}
{# TO DO : in dbt_project.yml, create as 'table' doesn't work #}
{# {{
  config(
    materialized = 'table',
    )
}} #}


WITH source AS (
	SELECT *

	FROM {{ source('thelook_ecommerce', 'orders') }}
)

SELECT
	-- IDs
	order_id,
	user_id,

	-- Timestamps
	created_at,
	returned_at,
	delivered_at,
	shipped_at,

	-- Other columns
	status,
	num_of_item AS num_items_ordered

FROM source
