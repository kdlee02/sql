-- Create a database called 'HospitalManagement'
DROP DATABASE IF EXISTS  HospitalManagement;
CREATE DATABASE HospitalManagement;
USE HospitalManagement;

-- 'Doctors' table
CREATE TABLE Doctors (
    doc_id INT(10) unique NOT NULL,
    major_treat VARCHAR(25) NOT NULL,
    doc_name VARCHAR(20) NOT NULL,
    doc_gen CHAR(1) NOT NULL,
    doc_phone VARCHAR(15),
    doc_email VARCHAR(50) UNIQUE,
    doc_position VARCHAR(20) NOT NULL,
    PRIMARY KEY (doc_id)
);

-- 'Nurses' table
CREATE TABLE Nurses (
    nur_id INT(10) unique NOT NULL,
    major_job VARCHAR(25) NOT NULL,
    nur_name VARCHAR(20) NOT NULL,
    nur_gen CHAR(1) NOT NULL,
    nur_phone VARCHAR(15),
    nur_email VARCHAR(50) UNIQUE,
    nur_position VARCHAR(20) NOT NULL,
    PRIMARY KEY (nur_id)
);

-- 'Patients' table
CREATE TABLE Patients (
    pat_id INT(10) unique NOT NULL,
    nur_id INT(10) NOT NULL,
    doc_id INT(10) NOT NULL,
    pat_name VARCHAR(20) NOT NULL,
    pat_gen CHAR(1) NOT NULL,
    pat_jumin VARCHAR(14) NOT NULL,
    pat_addr VARCHAR(100) NOT NULL,
    pat_phone VARCHAR(15),
    pat_email VARCHAR(50) UNIQUE,
    pat_job VARCHAR(20) NOT NULL,
    PRIMARY KEY (pat_id),
    FOREIGN KEY (nur_id) REFERENCES Nurses(nur_id) ON DELETE CASCADE,
    FOREIGN KEY (doc_id) REFERENCES Doctors(doc_id) ON DELETE CASCADE
);

-- 'Treatments' table
CREATE TABLE Treatments (
    treat_id INT(10) unique NOT NULL,
    pat_id INT(10) NOT NULL,
    doc_id INT(10) NOT NULL,
    treat_contents VARCHAR(1000) NOT NULL,
    treat_date DATE NOT NULL,
    PRIMARY KEY (treat_id,pat_id,doc_id),
    FOREIGN KEY (pat_id) REFERENCES Patients(pat_id) ON DELETE CASCADE,
    FOREIGN KEY (doc_id) REFERENCES Doctors(doc_id) ON DELETE CASCADE
);

-- 'Charts' table
CREATE TABLE Charts (
    chart_id VARCHAR(11) unique NOT NULL,
    treat_id INT(10) NOT NULL,
    pat_id INT(10) NOT NULL,
    doc_id INT(10) NOT NULL,
    nur_id INT(10) NOT NULL,
    chart_contents VARCHAR(1000) NOT NULL,
    PRIMARY KEY (chart_id, treat_id, pat_id, doc_id),
    FOREIGN KEY (treat_id) REFERENCES Treatments(treat_id) ON DELETE CASCADE,
    FOREIGN KEY (pat_id) REFERENCES Patients(pat_id) ON DELETE CASCADE,
    FOREIGN KEY (doc_id) REFERENCES Doctors(doc_id) ON DELETE CASCADE,
    FOREIGN KEY (nur_id) REFERENCES Nurses(nur_id) ON DELETE CASCADE
);

INSERT INTO Doctors (doc_id, major_treat, doc_name, doc_gen, doc_phone, doc_email, doc_position)
VALUES (980312, '소아과', '이태정', 'M', '010-111-1111', 'A1@h.com', '과장'),
(000601, '내과', '안성기', 'M', '010-111-1112', 'A2@h.com', '과장'),
(001208, '외과', '김민중', 'M', '010-111-1113', 'A3@h.com', '과장'),
(020403, '피부과', '이태서', 'M', '010-111-1114', 'A4@h.com', '전문의'),
(050900, '소아과', '김연아', 'F', '010-111-1115', 'A5@h.com', '전문의'),
(050101, '내과', '차태현', 'M', '010-111-1116', 'A6@h.com', '전문의'),
(062019, '소아과', '전지현', 'F', '010-111-1117', 'A7@h.com', '전문의'),
(070576, '피부과', '홍길동', 'M', '010-111-1118', 'A8@h.com', '전문의'),
(080543, '방사선과', '유재석', 'M', '010-111-1119', 'A9@h.com', '과장'),
(091001, '외과', '김병만', 'M', '010-111-1110', 'A0@h.com', '전문의');

INSERT INTO Nurses (nur_id, major_job, nur_name, nur_gen, nur_phone, nur_email, nur_position) VALUES
(050302, '소아과', '김은영', 'F', '010-222-2221', 'B1@h.com', '수간호사'),
(050021, '내과', '윤성애', 'F', '010-222-2222', 'B2@h.com', '수간호사'),
(040089, '외과', '신지원', 'M', '010-222-2223', 'B3@h.com', '주임'),
(070605, '피부과', '유정화', 'F', '010-222-2224', 'B4@h.com', '주임'),
(070804, '소아과', '라하나', 'F', '010-222-2225', 'B5@h.com', '주임'),
(071018, '내과', '김화경', 'F', '010-222-2226', 'B6@h.com', '간호사'),
(100356, '소아과', '이선용', 'M', '010-222-2227', 'B7@h.com', '간호사'),
(104145, '피부과', '김현', 'M', '010-222-2228', 'B8@h.com', '간호사'),
(120309, '방사선과', '박성완', 'M', '010-222-2229', 'B9@h.com', '간호사'),
(130211, '외과', '이서연', 'F', '010-222-2220', 'B0@h.com', '간호사');

INSERT INTO Patients (pat_id, nur_id, doc_id, pat_name, pat_gen, pat_jumin, pat_addr, pat_phone, pat_email, pat_job) VALUES
(2345, '050302', '980312', '안상건', 'M', '232345', '서울', '010-333-3331', 'C1@b.com', '회사원'),
(3545, '040089', '020403', '김성룡', 'M', '543545', '서울', '010-333-3332', 'C2@b.com', '자영업'),
(3424, '070605', '080543', '이종진', 'M', '433424', '부산', '010-333-3333', 'C3@b.com', '회사원'),
(7675, '100356', '050900', '최강석', 'M', '677675', '당진', '010-333-3334', 'C4@b.com', '회사원'),
(4533, '070804', '000601', '정한경', 'M', '744533', '강릉', '010-333-3335', 'C5@b.com', '교수'),
(5546, '120309', '070576', '유원현', 'M', '765546', '대구', '010-333-3336', 'C6@b.com', '자영업'),
(4543, '070804', '050101', '최재정', 'M', '454543', '부산', '010-333-3337', 'C7@b.com', '회사원'),
(9768, '130211', '091001', '이진희', 'F', '19768', '서울', '010-333-3338', 'C8@b.com', '교수'),
(4234, '130211', '091001', '오나미', 'F', '234234', '속초', '010-333-3339', 'C9@b.com', '학생'),
(7643, '071018', '062019', '송성목', 'M', '987643', '서울', '010-333-3340', 'C0@b.com', '학생');


INSERT INTO Treatments (treat_id, pat_id, doc_id, treat_contents, treat_date) VALUES
(230516023, 2345, 980312, '감기몸살', '2023-05-16'),
(230628100, 3545, 020403, '피부트블치료', '2023-06-28'),
(231205056, 3424, 080543, '목디스크MRI촬영', '2023-12-05'),
(231218024, 7675, 050900, '중이염', '2023-12-18'),
(231224012, 4533, 000601, '장염', '2023-12-24'),
(240103001, 5546, 070576, '여드름치료', '2024-01-03'),
(240109026, 4543, 050101, '위염', '2024-01-09'),
(240226102, 9768, 091001, '화상치료', '2024-02-26'),
(240303003, 4234, 091001, '교통사고외상치료', '2024-03-03'),
(240308087, 7643, 062019, '장염', '2024-03-08');


INSERT INTO Charts (chart_id, treat_id, doc_id, pat_id, nur_id, chart_contents) VALUES
('p_230516023', 230516023, 980312, 2345, 050302, '감기주사'),
('d_230628100', 230628100, 020403, 3545, 040089, '감염방지주사'),
('r_231205056', 231205056, 080543, 3424, 070605, '주사처방'),
('p_231218024', 231218024, 050900, 7675, 100356, '약처방'),
('i_231224012', 231224012, 000601, 4533, 070804, '입원치료'),
('d_240103001', 240103001, 070576, 5546, 120309, '약처방'),
('i_240109026', 240109026, 050101, 4543, 070804, '위내시경'),
('s_240226102', 240226102, 091001, 9768, 130211, '크림약처방'),
('s_240303003', 240303003, 091001, 4234, 130211, '입원치료'),
('p_240308087', 240308087, 062019, 7643, 071018, '입원치료');

-- 홍길동 의사가 맡고 있던 담당 진료과목이 피부과에서 소아과로 변경
select major_treat
from doctors
where doc_name = '홍길동';

UPDATE DOCTORS
set major_treat = '소아과'
where doc_name = '홍길동';

select major_treat
from doctors
where doc_name = '홍길동';

-- 라하나 간호사는 대학원 진학으로 오늘까지만 근무하고 퇴사하게 되어 삭제
select *
from Nurses
where nur_name = '라하나';

delete from Nurses
where nur_name = '라하나';

select *
from Nurses
where nur_name = '라하나';

-- 담당진료과목이 ‘소아과’인 의사에 대한 정보를 출력
SELECT *
FROM DOCTORS
WHERE major_treat = '소아과';

-- 홍길동 의사에게 진료받은 환자에 대한 모든 정보를 출력
SELECT *
from Patients
where doc_id = (select doc_id from Doctors where doc_name = '홍길동');

-- 진료날짜가 2023년 12월인 환자에 대한 모든 정보를 오름차순 정렬(날짜기준)하여 출력
select *
from patients, treatments
where patients.pat_id = treatments.pat_id AND YEAR(treatments.treat_date) = 2023 AND MONTH(treatments.treat_date) = 12
ORDER BY treatments.TREAT_DATE ASC;

-- 간호사 이름이 ‘김’으로 시작하는 모든 간호사 정보를 출력
select *
from nurses
where nur_name like '김%';


