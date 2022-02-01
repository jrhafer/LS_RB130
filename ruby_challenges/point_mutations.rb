# problem: given a series of capital letters of the same or
#          differing length, determine if there are any differences in
#          what letter is at what spot on the two lists
#          return this Number called the hamming distance

#          if one is shorter than the other, then only look for differences
#          up to that point

# Example: from the test suite, it appears there is a DNA class that takes
#          a string argument on instantiation - no test for validity required

#          the second instance method is called hamming_distance and appears to
#          return
#          an integer that correlates with the amount of differences in both
#          strand up to the sortest strand

# Data: input in constructor is a string
#       input in hamming_distance is a string
#       output of hamming_distance is an integer

# Algorithm: create a class called DNA that takes a single string arg and
#            assign it to an instance variable called dna_strand

#            for hamming_distance, create an instance method of same name and
#            name parameter other_dna_strand
#            - initialize a local variable in the method called mutations and
#              assign it to 0
#            - determine which is shorter and then iterate over that one by
#              calling Array#times on it's size and then pass a block that
#              has a block parameter named index and compare each string
#              object at the index being iterated over
#              - if there is a difference then increment value of mutations
#                variable by 1
#              - return mutations

class DNA
  def initialize(dna_strand)
    @dna_strand = dna_strand
  end

  def hamming_distance(other_dna_strand)
    mutations = 0
    length = @dna_strand.size > other_dna_strand.size ? \
    other_dna_strand.size : @dna_strand.size
    length.times do |index|
      mutations += 1 if @dna_strand[index] != other_dna_strand[index]
    end
    mutations
  end
end
