import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  stages: [
    { duration: '1m', target: 60 }, // simulate ramp-up of traffic from 1 to 60 users over 5 minutes.
    { duration: '1m', target: 160 }, // stay at 60 users for 10 minutes
    { duration: '3m', target: 1000 }, // ramp-up to 100 users over 3 minutes (peak hour starts)
    { duration: '2m', target: 1000 }, // stay at 100 users for short amount of time (peak hour)
    { duration: '3m', target: 500 }, // ramp-down to 60 users over 3 minutes (peak hour ends)
    { duration: '1m', target: 60 }, // continue at 60 for additional 10 minutes
    { duration: '10s', target: 0 }, // ramp-down to 0 users
  ],
};
export default function () {
  const BASE_URL = 'http://api-v1.my-domain.tech?num1=25&num2=25&num3=25'; // make sure this is not production

  const responses = http.batch([
    ['GET', `${BASE_URL}`],
  ]);

  sleep(1);
}


