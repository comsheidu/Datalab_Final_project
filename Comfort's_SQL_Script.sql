create schema Comfort_project;
use actions2load;
select * from actions2load;
desc actions2load;

#1. To know the most common events (i.e ReadingOwnedBook)
SELECT 
    MAX(event_type), COUNT(event_type)
FROM
    actions2load
GROUP BY event_type
ORDER BY event_type DESC;

#2. To know the least common events (i.e UnknownOridginLivebookLinkOp)

SELECT 
    min(event_type), COUNT(event_type)
FROM
    actions2load
GROUP BY event_type
ORDER BY event_type asc;

#Event type and frequency of event

SELECT 
    event_type, COUNT(account_id) AS frequency_of_event
FROM
    actions2load
GROUP BY event_type
ORDER BY frequency_of_event DESC;

#3. Account Id with the highest number of events (caffe2b03e6057845c52212acaaa1a34, '1574')

select account_id, count(event_type) as number_of_event from actions2load
group by account_id
order by number_of_event desc;

#4. Account Id with the least number of events (eb2a4af4df682ad39d2a3901df023a9a, '1')

select account_id, count(event_type) as number_of_event from actions2load
group by account_id
order by number_of_event asc;

#5. How many times events occured based on different times of the day

SELECT 
    DATE_FORMAT(event_time, '%H:%i') AS time_of_the_day,
    COUNT(event_type) AS event_count
FROM
    actions2load
GROUP BY time_of_the_day
ORDER BY time_of_the_day;
