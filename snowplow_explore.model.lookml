- connection: "ctfl_redshift"

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: event
  sql_always_where: ${event.domain_user_id} is not null
  joins:
    - join: session
      type: inner
      relationship: many_to_one
      sql_on: ${event.domain_user_id} = ${session.domain_user_id} AND ${event.domain_session_index} = ${session.domain_session_index}
      
- explore: session

