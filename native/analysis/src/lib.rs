pub fn analysis_setup(a: i64, b: i64) -> i64 {
    a.wrapping_add(b)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        assert_eq!(analysis_setup(2, 2), 4);
    }
}
