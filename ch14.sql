SELECT *
FROM (  select region, gubun, loan_jan_amt
          from KOR_LOAN_STATUS
          where period like '2013%'
            and region in ('서울','대전', '부산', '울산', '인천', '광주', '세종')
       )
PIVOT ( sum(loan_jan_amt)
          FOR region
  IN ( '서울','대전', '부산', '울산', '인천', '광주', '세종' )
      );