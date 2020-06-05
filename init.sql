create table image(
  filename text not null,
  checksum text not null,
  created_at datetime default current_timestamp
);

create index image_checksum_idx on image(checksum);
