use sakila;




# create a view that summarizes rental information for each customer

create view rental_summary_view as
select
  c.customer_id,
  concat(c.first_name, ' ', c.last_name) as customer_name,
  c.email,
  count(r.rental_id) as rental_count
from
  customer c
left join rental r on c.customer_id = r.customer_id
group by
  c.customer_id;
  
  
  


# create a Temporary Table that calculates the total amount paid by each customer 

create temporary table pst_t as
select
  rsv.customer_id,
  sum(payment.amount) as total_paid
from
  rental_summary_view rsv
left join payment on rsv.customer_id = payment.customer_id
group by
  rsv.customer_id;
  






# Create a CTE and the Customer Summary Report

with CustomerSummaryCTE as (select
                            rsv.customer_name,
						    rsv.email,
                            rsv.rental_count,
                            pst_t.total_paid,
                        case
						when rsv.rental_count = 0 then 0
                        else pst_t.total_paid / rsv.rental_count
                        end as average_payment_per_rental
                        from
                        rental_summary_view rsv
                        left join pst_t on rsv.customer_id = pst_t.customer_id)


select
  customer_name,
  email,
  rental_count,
  total_paid,
  average_payment_per_rental
from
  CustomerSummaryCTE;



